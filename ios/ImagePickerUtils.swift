// Copyright 2024-present 650 Industries. All rights reserved.

/**
 Asynchronously maps the given sequence (sequentially).
 */
func asyncMap<ItemsType: Sequence, ResultType>(
  _ items: ItemsType,
  _ transform: (ItemsType.Element) async throws -> ResultType
) async rethrows -> [ResultType] {
  var values = [ResultType]()

  for item in items {
    try await values.append(transform(item))
  }
  return values
}

/**
 Concurrently maps the given sequence.
 */
func concurrentMap<ItemsType: Sequence, ResultType>(
  _ items: ItemsType,
  _ transform: @escaping (ItemsType.Element) async throws -> ResultType
) async rethrows -> [ResultType] {
  let tasks = items.map { item in
    Task {
      try await transform(item)
    }
  }
  return try await asyncMap(tasks) { task in
    try await task.value
  }
}

/**
 Concurrently maps the given sequence with index.
 */
func concurrentMapEnumerated<ItemsType: Sequence, ResultType>(
  _ items: ItemsType,
  _ transform: @escaping (ItemsType.Element, Int) async throws -> ResultType
) async rethrows -> [ResultType] {
  let tasks = items.enumerated().map { index, item in
      Task {
        try await transform(item, index)
      }
  }
  return try await asyncMap(tasks) { task in
      try await task.value
  }
}

/**
 Concurrently maps the given sequence with index. Queues to avoid crashes.
 */
func concurrentMapEnumeratedQueued<ItemsType: Sequence, ResultType>(
  _ items: ItemsType,
  _ transform: @escaping (ItemsType.Element, Int) async throws -> ResultType
) async rethrows -> [ResultType] {
  // 10 here is arbitrary and untested
  // It just seems like a solid number for file copy intensive operations
  let semaphore = AsyncSemaphore(value: 10)
  let tasks = items.enumerated().map { index, item in
      Task.detached {
        await semaphore.wait()
        defer { semaphore.signal() }
        return try await transform(item, index)
      }
  }
  return try await asyncMap(tasks) { task in
      try await task.value
  }
}